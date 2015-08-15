<http://maxdemarzi.com/2012/01/04/getting-started-with-ruby-and-neo4j/>

Install the gem and launch neo4j

    By default neo4j is binded on http://localhost:7474 but you can change it in
    neo4j/conf/neo4j-server.properties file.
    [source,bash]

gem install neography echo "require *neography/tasks*" \> Rakefile rake neo4j:install rake neo4j:start

    Example of usage

``` ruby
require 'rubygems'
require 'neography'

@neo = Neography::Rest.new

node1 = @neo.create_node("name" => "node1")
node2 = @neo.create_node("name" => "node2")

@neo.create_relationship("there_is_a_relation", node1, node2)

def suggestions_for(node)
  @neo.traverse(node,
                "nodes",
                {"order" => "breadth first",
                 "uniqueness" => "node global",
                 "relationships" => {"type"=> "friends",
                                     "direction" => "in"},
                 "return filter" => {"language" => "javascript",
                                     "body" => "position.length() == 2;"},
                 "depth" => 2}).map{|n| n["data"]["name"]}.join(', ')
end

johnathan = create_person('Johnathan')
mark      = create_person('Mark')
phil      = create_person('Phil')
mary      = create_person('Mary')
luke      = create_person('Luke')

make_mutual_friends(johnathan, mark)
make_mutual_friends(mark, mary)
make_mutual_friends(mark, phil)
make_mutual_friends(phil, mary)
make_mutual_friends(phil, luke)

puts "Johnathan should become friends with #{suggestions_for(johnathan)}"
```
