# 3. Дан целочисленный массив. Вывести номер первого из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ].
[1, 2, 3].detect.with_index { |item, i| a[0]<a[i] && a[i]<a[-1] }

# 6. Дан целочисленный массив. Преобразовать его, прибавив к четным числам последний элемент. Первый и последний элементы массива не изменять.
a = [1, 2, 3, 4, 5, 6]
a[1..a.size-2].each.with_index(1) { |item, i| a[i]+=a[-1] if item.even? }
a

# 9. Дан целочисленный массив. Заменить все положительные элементы на значение минимального.
a=[1, -5, 2, -6, 7]
a.map! { |item| item>0 ? a.min : item }

# 12. Дан целочисленный массив. Заменить все отрицательные элементы на значение максимального.
a=[1, -5, 2, -6, 7]
a.map! { |item| item<0 ? a.max : item }

# 15. Дан целочисленный массив. Проверить, образуют ли элементы арифметическую прогрессию. Если да, то вывести разность прогрессии, если нет - вывести nil.
a= [1, 2, 3, 4, 5, 6]
# 1)
diff=a[1]-a[0]
a.each_with_index do |item, i|
 break nil if (i>1 && a[i]-a[i-1] != diff)
 break diff if i==a.size-1
end
# 2)
diff_arr=a[1..a.size-1].map.with_index(1) { |item, i| item-a[i-1] }
diff_uniq=diff_arr.uniq
diff_uniq.size==1 ? diff_uniq[0] : nil

# 18. Дан целочисленный массив. Найти количество его локальных минимумов.
a=[1, 0, 2, 3, 2, 5, 6, 7, 2, 1, 1]
a[1..a.size-2].select.with_index(1) { |item, i| a[i]<a[i-1] && a[i]<a[i+1] }.size

# 21. Дан целочисленный массив. Определить количество участков, на которых его элементы монотонно возрастают.
rise_count=0
a=[1, 0, 2, 3, 2, 5, 6, 7, 2, 1, 1]
to_grow=false
a[1..a.size-1].each.with_index(1) do |item, i|
 if a[i]<=a[i-1]
  to_grow=false
 else
  if !to_grow
   rise_count+=1
   to_grow=true
  end
 end
end
rise_count

# 24. Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наименее близок к данному числу.
r=1.1234567
a=[1.1, 2.3, 1.123, 3.14, -1.1]
a.map { |item| [(r-item).abs, item] }.max[1]

# 27. Дан целочисленный массив. Преобразовать его, вставив после каждого положительного элемента нулевой элемент.
a=[1,-4,5,8,-3,-2,0,4]
a = a.map.with_object([]) do |item, acc|
  acc << item
  acc << a[0] if item>0
end

# 30. Дан целочисленный массив. Упорядочить его по убыванию.
a=[1, 0, -4, 5, 0, 8, 0, -3, -2, 0, 4, 0]
a.sort { |a, b| -(a<=>b) }

# 33. Дан целочисленный массив. Найти индекс минимального элемента.
a=[1, 0, -4, 5, 0, 8, 0, -3, -2, 0, 4, 0]
a.index(a.min)

# 36. Дан целочисленный массив. Найти индекс первого максимального элемента.
a=[1, 0, -4, 5, 0, 8, 0, -3, -2, 0, 4, 0]
a.index(a.max)

# 39. Дан целочисленный массив. Найти количество минимальных элементов.
a=[1,2,3,-3,-3,2,-3]
# 1)
a.select { |item| item==a.min }.size
# 2)
a.count a.min

# 42. Дан целочисленный массив. Найти минимальный нечетный элемент.
a=[1,2,3,-3,-9,2,-1]
a.inject(a.max) { |min, item| min=item if(item<min && item.odd?); min }

# 45. Дан целочисленный массив. Найти минимальный положительный элемент.
a=[1,2,3,-3,-9,2,-1]
min=a.inject(a.max) { |min, item| min=item if(item<min && item>0); min }
min<0 ? nil : min

# 48. Дан целочисленный массив и интервал a..b. Найти максимальный из элементов в этом интервале.
a=[1,-5,6,4,8,12,2]\
a.select { |item| range.include?(item) }.max

# 51. Дан целочисленный массив. Найти количество элементов, расположенных после первого максимального.
a=[1,0,2,3,2,5,6,6,2,1,1]
a.size - 1 - a.index(a.max)

# 54. Дан целочисленный массив. Найти количество элементов, расположенных перед последним минимальным.
a=[1,0,2,3,0,5,6,6,2,1,1]
a.rindex(a.min)

# 57. Дан целочисленный массив. Найти индекс первого экстремального (то есть минимального или максимального) элемента.
a=[1,0,2,3,0,5,6,6,2,1,1]
min_index = a.index(a.min)
max_index = a.index(a.max)
min_index < max_index ? min_index : max_index

# 60. Дан целочисленный массив. Найти количество элементов, между первым и последним максимальным.
a=[1,0,2,6,0,5,6,6,2,1,1]
a.rindex(a.max) - a.index(a.max) - 1

# 63. Дан целочисленный массив. Найти максимальное количество подряд идущих минимальных элементов.
a=[0,0,2,6,0,5,6,6,0,0,0,0,3,0,0]
min = a.min
a.each_with_object([]) do |item, min_in_a_row_arr|
  if item == min
    min_in_a_row += 1
  else
    min_in_a_row = 0
  end
  min_in_a_row_arr << min_in_a_row
end.max

# 66. Дан целочисленный массив. Вывести вначале все его нечетные элементы, а затем - четные.
a=[0,0,2,6,1,5,6,6,5,3,0,0]
a.select { |item| item.odd? } + a.select { |item| item.even? }

# 69. Дано вещественное число R и массив вещественных чисел. Найти два элемента массива, сумма которых наиболее близка к данному числу.
a=[1.56, 7.22, 12.1, -1.45, 6.34]
r=11.5
a.combination(2).to_a.min { |comb| (comb[0]+comb[1]-r).abs }

# 72. Дан целочисленный массив. Удалить все элементы, встречающиеся более двух раз.
a=[0,0,2,6,1,5,6,6,5,3,0,0]
a.delete_if { |item| a.count(item)>2 }

# 75. Дан целочисленный массив. Найти среднее арифметическое модулей его элементов.
a=[1,2,3,-3,-9,2,-1]
a.inject(0.0) { |sum, item| sum+=item.abs } / a.size

# 78. Дано целое число. Найти произведение его цифр.
num=4354628684
# 1)
num.to_s.split('').inject(1) { |res, item| res*=item.to_i }
# 2)
dup=num
res=1
while dup != 0 do
  res *= dup%10
  dup /= 10
end
res
# 3)
num.to_s.chars.map(&:to_i).reduce(:*)

# 81. Дан дипапазон a..b. Получить массив из чисел, расположенных в этом диапазоне (исключая сами эти числа), в порядке их убывания, а также размер этого массива.
range=(1..12)
a=range.to_a[1..range.size-2].reverse
a.size

# 84. Дано натуральное число N. Найти результат следующего произведения 1*2*…*N.
n=5
# 1)
def factorial(n)
  return 1 if n <= 1
  return n * factorial(n-1)
end
factorial n
# 2)
(1..n).inject(:*)

# 87. Дан целочисленный массив. Найти все четные элементы.
a=[2,34,6,7,1,22,343]
a.select { |item| item.even? }

# 90. Дан целочисленный массив. Найти количество нечетных элементов.
a=[2,34,6,7,1,22,343]
a.select { |item| item.odd? }.size

# 93. Дан целочисленный массив и число К. Если все элементы массива меньше К, то вывести true; в противном случае вывести false.
k=12
a=[1,23,4,2,4]
a.detect { |item| item>=k }.nil?
 # => false
a=[1,5,6,3]
a.detect { |item| item>=k }.nil?
 # => true

# 96. Дан целочисленный массив и число К. Вывести индекс первого элемента, большего К.
k=12
a=[1,5,6,3]
a.index(a.detect { |item| item>k })
 # => nil
a=[1,45,6,3]
a.index(a.detect { |item| item>k })
 # => 1

# 99. Дан целочисленный массив. Вывести индексы элементов, которые меньше своего правого соседа, и количество таких чисел.
a=[23,4,5,3,22,25,6,34]
a[0..a.size-2].select.with_index { |item, i| puts i if(item<a[i+1]); item<a[i+1] }.size
# 1
# 3
# 4
# 6
#  => 4

# 102. Дан целочисленный массив. Проверить, образует ли он возрастающую последовательность.
def inc_sequence? a
  a[1..a.size-1].select.with_index(1) { |item, i| item>a[i-1] }.size+1==a.size
end
inc_sequence? [23,4,5,3,22,25,6,34]
 # => false
inc_sequence? [1,2,3,4,5,6,7]
 # => true

# 105. Дан целочисленный массив. Если данный массив образует убывающую последовательность, то вывести nil, в противном случае вывести номер первого числа, нарушающего закономерность.
def wrong_decr_seq_element a
  a.index(a[1..a.size-1].detect.with_index(1) { |item, i| p item; item>a[i-1] })
end
wrong_decr_seq_element [1,2,3,4,5,6,7]
 # => 1
wrong_decr_seq_element [5,4,3,2,1]
 # => nil

# 108. Дан целочисленный массив и целое число К. Возвести в степень К все элементы массива.
k=4
a=[5,4,3,2,1]
a.map! { |item| item=item**k }

# 111. Дан целочисленный массив. Переставить в обратном порядке элементы массива, расположенные между его минимальным и максимальным элементами.
a=[5,23,4,67,1,23,56,0]
min_index=a.index(a.min)
 # => 7
max_index=a.index(a.max)
 # => 3
range=min_index<max_index ? min_index..max_index : max_index..min_index
 # => 3..7
a[range]=a[range].reverse
 # => [0, 56, 23, 1, 67]
a
 # => [5, 23, 4, 0, 56, 23, 1, 67]

