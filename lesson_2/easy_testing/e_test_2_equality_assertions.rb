# Minitest to fail if value.downcase does not return 'xyz'

assert_equal('xyz', 'XYZ'.downcase)
