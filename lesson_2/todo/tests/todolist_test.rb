require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../my_todo_with_more.rb'

class TodoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new('Buy milk')
    @todo2 = Todo.new('Clean room')
    @todo3 = Todo.new('Go to gym')
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todos.first, @list.first)
  end

  def test_last
    assert_equal(@todos.last, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(2, @list.size)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal(2, @list.size)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_error_on_adding_non_todo
    assert_raises(TypeError) { @list.add("Non-ToDo object")}
  end

  def test_shovel
    new_todo = Todo.new("Do something")
    @list << new_todo
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_add
    new_todo = Todo.new("Do something")
    @list.add(new_todo)
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(500) }
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(500) }
    @list.mark_done_at(1)
    assert(@list.item_at(1).done?, "Item failed to be marked done.")
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(500) }
    @list.mark_done_at(1)
    assert(@list.item_at(1).done?, "Item failed to be marked as done.")
    @list.mark_undone_at(1)
    refute(@list.item_at(1).done?, "Item failed to be marked undone.")
  end

  def test_done!
    @list.done!
    @list.each { |todo| assert_equal(true, todo.done?) }
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(500) }
    @list.remove_at(1)
    assert_equal(@todo3, @list.item_at(1))
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    done_mark = Todo::DONE_MARKER

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [#{done_mark}] Clean room
    [ ] Go to gym
    OUTPUT

    @todo2.done!
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    done_mark = Todo::DONE_MARKER

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [#{done_mark}] Buy milk
    [#{done_mark}] Clean room
    [#{done_mark}] Go to gym
    OUTPUT

    @todos.each(&:done!)
    assert_equal(output, @list.to_s)
  end

  def test_each_iteration
    counter = 0
    @list.each { |_| counter += 1 }

    result = []
    @list.each { |todo| result << todo }

    assert_equal(3, counter)
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_each_return
    returned_value = @list.each { |_| nil }

    assert_same(returned_value, @list)
  end

  def test_title
    assert_equal("Today's Todos", @list.title)
  end

  def test_select
    empty_list = @list.select { |todo| todo == nil }
    assert_instance_of(TodoList, empty_list)

    non_empty_list = @list.select { |todo| !todo.done? }
    assert_instance_of(TodoList, non_empty_list)

    new_list = TodoList.new(@list.title)
    assert_equal(new_list.to_s, @list.select { |todo| todo.done? }.to_s)

    @todo1.done!
    new_list.add(@todo1)
    assert_equal(new_list.to_s, @list.select { |todo| todo.done? }.to_s)
  end

  def test_all_done
    new_list = TodoList.new(@list.title)
    assert_equal(new_list.to_s, @list.all_done.to_s)

    @todo1.done!
    new_list.add(@todo1)
    assert_equal(new_list.to_s, @list.all_done.to_s)
  end

  def test_all_not_done
    new_list = TodoList.new(@list.title)

    @todo1.done!
    new_list.add(@todo2)
    new_list.add(@todo3)
    
    assert_equal(new_list.to_s, @list.all_not_done.to_s)
  end

  def test_find_by_title
    assert_nil(@list.find_by_title('kjeaijeijaijaijaa!!!'))
    assert_equal(@todo1, @list.find_by_title('Buy milk'))
  end

  def test_mark_done_by_title
    @list.mark_done("Buy milk")
    assert(@todo1.done?)
  end

  def test_mark_all_undone
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_all_undone
    assert(!@list.done?)
  end
end
