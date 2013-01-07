require 'rubygems'
require 'nokogiri'
require 'fileutils'

html_folder = "./html" # Where you generate your html files
txt_folder = "./" # Where you write your notes
github_link = "https://github.com/pryz[github.com/Pryz]"

desc "Default task : build html and index"
task :default do
    Rake::Task[:genhtml].invoke
    sleep 0.2
    Rake::Task[:genindex].invoke
end

desc "Generate HTML files from .txt asciidoc files"
task :genhtml, [:theme, :backend] do |t, args|
    args.with_defaults(:theme => "pryz", :backend => "lofic_backend")
    puts "Building notes with the theme : #{args.theme} and the backend : lofic"

    if not File.directory? html_folder
        puts "mkdir html"
        Dir.mkdir html_folder
    end
    FileUtils.cp(Dir.glob("#{txt_folder}/*.txt"),html_folder)
    #FileUtils.cd(html_folder)
    txtfilelist=Dir.glob("#{html_folder}/*.txt")

    if txtfilelist.empty?
        puts "No .txt files... exiting"
        exit
    end

    until txtfilelist.empty?
        Thread.new { 
            file=txtfilelist.pop
            %x[asciidoc  --backend=#{args.backend} --theme=#{args.theme} #{file}] 
        } unless Thread.list.length > 32
    end
    loop do
        if Thread.list.length < 2
            FileUtils.rm(Dir.glob("#{html_folder}/*.txt")) if Thread.list.length < 2
            break
        end
        sleep 0.1
    end
end

desc "Generate one file"
task :genfile, [:file, :theme, :backend] do |t, args|
    args.with_defaults(:theme => "pryz", :backend => "lofic")
    if File.exists?(args.file)
        puts "Building html for : #{args.file}"
        %x[asciidoc -o html/#{args.file.delete(".txt")}.html --theme=#{args.theme} --backend=#{args.backend} #{args.file}]
    else
        puts "File #{args.file} doesn't exist"
    end
end

desc "Generate Index file"
task :genindex, [:theme, :backend] do |t, args|
    args.with_defaults(:theme => "pryz", :backend => "index_list")
    puts "Building index with the theme : #{args.theme} and the backend : #{args.backend}"
    index_file = "index.txt"
    index = File.open(index_file, 'w+')
    head_content = <<EOT
Notes 
===== 

link:#{github_link}

List
---- 
    
EOT
    index.write(head_content)
    txtfilelist=Dir.glob("#{html_folder}/*.html")
    until txtfilelist.empty?
        note_file = txtfilelist.pop
        page = Nokogiri::HTML(open(note_file))
        title = page.css('title').text
        tags = ""
        page.xpath('//div[@class="paragraph"]').each do | div |
            tags = div.content if div.content.match(/Additional tags :/)
        end
        index.write("* link:#{note_file}[#{title}] #{tags}\n")
    end
    index.close
    %x[asciidoc --theme=#{args.theme} --backend=#{args.backend} #{index_file}]
    File.delete(index_file)
end
