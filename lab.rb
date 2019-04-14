#!/usr/bin/env ruby

sentence_ua = "Коротко про мене: в даний момент я вивчаю нову мову \n
               програмування рубі!"

string = "Коротко про мене я шукаю 3 літери о в різних словах: 01 January 2019\n
         можливо то колобок або одоробла. Можливо більше. 29.July.1999 or \n
         29.07.1999 Лоооом не не канає а гооол канає. Я проснувся о 09:55:30,\n
         хоча планував 09:30:01 31.12.2019 31.13.2019 32.12.2019. Знайти усі\n
         слова без букв що повторюються (наприклад, 'Лісп' або 'Ruby', але не\n
         'Паскаль' або 'Java'). Hе враховуйте цифри в словах.\n
         Hello. Коротко про мене: At the moment, I'm learning a new \n
         programming language for Ruby! 1234 56748 "

text = 'wORd1 WOrd2 word3 word4 WoRD5'

def max_length_word(sentence_ua)
  # Даний рядок слів, розділених пробілами. Вивести найдовше слово

  puts "Max word is: \t\t\t\t\t\t" + sentence_ua.split(' ').max_by(&:length)
end

max_length_word(sentence_ua)

def middle_length_words(string)
  # Даний рядок, що містить кирилицю, латиницю і цифри. Вивести
  # усі слова, довжина яких рівна середній

  sentence = string.scan(/[a-zA-ZА-Яа-яё0-9]+/)
  size = sentence.size
  result = 0.0
  sentence.each do |elem|
    result += elem.size
  end
  medium = (result / size).round

  puts "Words middle length are: \t\t\t" +
       sentence.find_all { |e| e.size == medium }.to_s
end

middle_length_words(string)

def find_cyr_word(string)
  # Знайти в рядку перше цілком кириличне слово

  f_c_word = string.scan(/\b[А-Яа-яё]+\b/)
  puts "First cyrillic word is: \t\t\t" + f_c_word[0]
end

find_cyr_word(string)

def word_with_3_letters_o(string)
  # Даний текст (рядок з перенесеннями). Знайти усі слова, що містять
  # лише три букви "о"

  array = string.scan(/[а-яА-Я]+/)
  puts "3 o exist into next words: \t\t\t" +
       array.map { |elem| elem.split(//).find_all { |el| el == 'о' }.size == 3 ? elem : nil}.compact.to_s

end

word_with_3_letters_o(string)

def find_data_hh_mm_ss(string)
  # Знайти в тексті час у форматі "години:хвилини:секунди"

  dates = string.scan(/\b(?:[01]?[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]\b/)
  puts "Dates into text hh-mm-ss are: \t\t" + dates.to_s
end

find_data_hh_mm_ss(string)

def words_without_repeat_letters(string)
  # Знайти усі слова без букв що повторюються (наприклад, "Лісп" або "Ruby",
  # але не "Паскаль" або "Java"),.не враховуйте цифри в словах.

  words = string.scan(/\b[\p{Cyrillic}\p{Digit}]+\b/)
  result = words.select do |word|
    without_digits = word.downcase.scan /\p{Cyrillic}/
    without_digits.uniq.size == without_digits.size
  end

  puts "Words without repeat letters: \t\t" + result.to_s
end

words_without_repeat_letters(string)

def fix_two_capital_letters(text)
  # Знайти в тексті слова, що містять дві прописні букви і виправити

  words = text.split(/\W+/)

  words.each do |w|
    if w =~ /[A-Z]{2}/
      w.downcase!
      w.capitalize!
    end
  end

  puts "Words with 2 capital letters: \t\t" + words.join(' ')
end

fix_two_capital_letters(text)

def find_data_day_month_year(string)
  # Знайти в тексті дати формату "день.місяць.рік"

  dates = string.scan(/\b([0-2]\d|3[0-1]).(0[1-9]|1[0-2]|January|February|March|April|May|June|July|August|September|October|November|December).(\d{4})\b/).map{|e| e.join('.')}.join(' ')

  puts "Dates into text dd-month-yyyy are: \t" + dates.to_s
end

find_data_day_month_year(string)

def find_data_dd_mm_yyyy(string)
  # Знайдіть дату, де день обмежений числом 31, а місяць 12. Рік обмежуйте
  # чотиризначними числами.

  dates = string.scan(/\b([0-2]\d|3[01])\.(0\d|1[012])\.(\d{4})\b/)
  puts "Dates into text dd.mm.yyyy are: \t" + dates.to_s
end

find_data_dd_mm_yyyy(string)

def find_root_url
  # Дано текст. Знайдіть усі URL адреси і виділіть з них тільки кореневий домен
  # (наприклад, з https://en.wikibooks.org/wiki/Ruby_Programming зробіть
  # https://en.wikibooks.org).

  url = 'https://en.wikibooks.org/wiki/Ruby_Programming'
  puts "Root URL is: \t\t\t\t\t\t" +
       ((url.split('//')[0]) + '//' + (url.split('//')[1].split('/')[0]))
end

find_root_url
