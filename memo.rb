require "csv"
 
def file_name()
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp
  file_name = file_name + ".csv"
end

def convert(purpose)
  puts purpose
  puts "完了したらCtrl + Dをおします"
  file_content = readlines
  file_content = file_content.join(",")
  file_content = file_content.gsub(/\n,/,"\n") #改行後の行頭にカンマが入るのを防ぐ
  file_content = file_content.split(",")
end

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i

if memo_type == 1
  newfile_name = file_name()
  purpose = "メモしたい内容を記入してください"
  newfile_content = convert(purpose)
  CSV.open(newfile_name,'w',:quote_char => "") do |output|
    output << newfile_content
  end
elsif memo_type == 2
  file_name = file_name()
  purpose = "追記したい内容を記入してください"
  addfile_content = convert(purpose)
  CSV.open(file_name,'a',:quote_char => "") do |output|
    output << addfile_content
  end
else
  puts "数字の1か2を入力してください"
end