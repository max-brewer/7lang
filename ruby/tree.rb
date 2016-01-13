#!/usr/local/bin/ruby -w
class Tree
	attr_accessor :children, :node_name
	def initialize(hash)
		raise "expected Hash but got #{hash.class}" unless hash.class == Hash
		raise "tree must have one and only one root" unless hash.keys.length == 1

		node_key = hash.keys[0]
		@node_name = node_key.to_s
		@children = hash[node_key].collect do |key, value|
			Tree.new(key => value)
		end
	end

	def visit_all(&block)
		visit &block
		children.each {|child| child.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

ruby_tree = Tree.new('grandpa'=>{'dad'=>{'child 1'=>{},'child 2'=>{}},'uncle'=>{'child 3'=>{},'child 4'=>{}}})

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}

puts "Visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

