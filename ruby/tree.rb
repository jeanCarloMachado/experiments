class Tree
	attr_accessor :children, :node_name
	
	def initialize(name, children=[])
		@children = children.keys.collect {|i| Tree.new(i, children[i])}
		@node_name = name
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

ruby_tree = Tree.new('foo', {'grandpa'=>{'dad'=>{'child1'=>{}, 'child2'=>{}},'uncle'=>{'child3'=>{}, 'child4'=>{}}}})

puts "visiting node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
