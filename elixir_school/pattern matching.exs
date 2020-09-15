# 논리연산자
IO.inspect {a, b, c} = {:hello, "world", 42}
IO.inspect {:ok, result} = {:ok, 13}
IO.inspect result
IO.inspect [a, b, c] = [1, 2, 3]
IO.inspect [head | tail] = [1, 2, 3]
IO.inspect head
IO.inspect tail