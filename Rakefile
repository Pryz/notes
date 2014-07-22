require 'rubygems'
require 'nokogiri'
require 'fileutils'

subheader_link = "https://github.com/pryz[github.com/Pryz]"

html_folder = "./html" # Where you generate your html files
txt_folder = "./" # Where you write your notes

desc "Default task : build html and index"
task :default do
    Rake::Task[:genhtml].invoke("note_bootstrap")
    sleep 0.2
    Rake::Task[:genindex].invoke("index_bootstrap")
end

desc "Generate HTML files from .txt asciidoc files"
task :genhtml, [:backend] do |t, args|
    puts "Building notes..."

    if not File.directory? html_folder
        puts "mkdir html"
        Dir.mkdir html_folder
    end
    FileUtils.cp(Dir.glob("#{txt_folder}/*.txt"),html_folder)
    txtfilelist=Dir.glob("#{html_folder}/*.txt")

    if txtfilelist.empty?
        puts "No .txt files... exiting"
        exit
    end

    until txtfilelist.empty?
        Thread.new { 
            file=txtfilelist.pop
            %x[asciidoc --backend=bootstrap -a source-highlighter=pygments -a theme=readable -a totop -a footer-fullwidth -a jumbotron #{file}]
        } unless Thread.list.length > 32
    end
    loop do
        if Thread.list.length < 2
            FileUtils.rm(Dir.glob("#{html_folder}/*.txt")) if Thread.list.length < 2
            break
        end
        sleep 0.1
    end
    `sed -i '/^Last updated/d' #{html_folder}/*.html`
end

desc "Generate one file"
task :genfile, [:file, :theme, :backend] do |t, args|
    args.with_defaults(:theme => "pryz", :backend => "lofic")
    if File.exists?(args.file)
        puts "Building html for : #{args.file}"
        %x[asciidoc -o #{html_folder}/#{args.file.delete(".txt")}.html --theme=#{args.theme} --backend=#{args.backend} #{args.file}]
    else
        puts "File #{args.file} doesn't exist"
    end
end

desc "Generate Index file"
task :genindex, [:backend] do |t, args|
    puts "Building index..."
    index_file = "index.txt"
    FileUtils.cd(html_folder)
    index = File.open(index_file, 'w+')
    head_content = <<EOT
=== Notes 

link:#{subheader_link}

List
---- 
    
EOT
    index.write(head_content)
    txtfilelist=Dir.glob("*.html")
    until txtfilelist.empty?
        note_file = txtfilelist.pop
        page = Nokogiri::HTML(open(note_file))
        title = page.css('title').text
        tags = ""
        page.xpath('//div[@class="paragraph"]').each do | div |
            tags = div.content if div.content.match(/Additional tag/)
        end
        if tags.empty?
            index.write("* link:#{note_file}[#{title}]\n")
        else
            index.write("* link:#{note_file}[#{title}] -h-#{tags}-h-\n")
        end
    end
    index.close
    %x[asciidoc --backend=index_bootstrap #{index_file}]
    File.delete(index_file)
end
