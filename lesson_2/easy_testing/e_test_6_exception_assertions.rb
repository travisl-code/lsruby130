# Assertion fails unless `employee.hire` raises `NoExperienceError` exception

assert_raises(NoExperienceError) do
  employee.hire
end