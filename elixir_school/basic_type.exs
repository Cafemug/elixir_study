# 기본 타입
IO.puts 1
IO.puts 0x1F
IO.puts 1.0
IO.puts :atom

# 사칙연산
IO.puts div(10, 2)
IO.puts div 10, 2
IO.puts rem 10, 3

# 반올림, 버림
IO.puts  round 3.58
IO.puts  trunc 3.58

# boolean
IO.puts true
IO.puts true == false
IO.puts is_boolean(true)
IO.puts is_boolean(1)

# Atoms - 이름이 자신의 값을 나타내는 함수
IO.puts :hello
IO.puts :hello == :world
IO.puts  true == :true
IO.puts is_atom(false)

# 문자열 - 큰따옴표 안에쓰고 utf-8로 인코딩함
IO.puts "hellö"
IO.puts "hellö #{:world}"
IO.puts "hello\nworld"
IO.puts is_binary("hellö")
IO.puts byte_size("hellö") # 바이트 사이즈
IO.puts String.length("hellö") # 문자열 길이
IO.puts String.upcase("hellö")
# 큰따옴표랑 작은따옴표랑은 다름
IO.puts 'hellö' == "hellö"

# 익명함수
add = fn a, b -> a + b end
IO.puts is_function(add)
IO.puts is_function(add, 2)
IO.puts add.(1, 2)
add_two = fn a -> add.(a, 2) end
IO.puts add_two.(2)
x = 42
IO.puts (fn -> x = 0 end).()
IO.puts  x

# 연결리스트
IO.inspect [1, 2, true, 3]
IO.puts length [1, 2, 3]
IO.inspect  [1, 2, 3] ++ [4, 5, 6]
IO.inspect  [1, true, 2, false, 3, true] -- [true, false]

list = [1,2,3]
IO.inspect hd(list)
IO.inspect tl(list)

# 튜플
IO.inspect {:ok, "hello"}
IO.inspect  tuple_size {:ok, "hello"}
tuple = {:ok, "hello"}
IO.inspect elem(tuple, 1)
IO.inspect  tuple_size(tuple)