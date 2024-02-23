# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# seed操作
BUREAUS = [
  { name: '総務局', slug: 'general', description: '生活事項全般の雑多な記事' },
  { name: '財務局', slug: 'finance', description: 'ほしのなか政府の財政・お金関係の記事' },
  { name: '法務局', slug: 'justice', description: 'ほしのなか政府で策定、議論された規則や条例・その他法律に関する記事' },
  { name: '医務局', slug: 'medical', description: '健康・医薬品などの記事' },
  { name: '労務局', slug: 'labor', description: '仕事・就職に関する記事' },
  { name: '学務局', slug: 'education', description: '教育・資格に関する記事' },
  { name: '外交局', slug: 'foreign', description: 'イベント・交流などの記事' },
  { name: '娯楽局', slug: 'entertainment', description: 'ゲーム・カラオケなどの趣味、その考え方に関する記事' },
  { name: '広報局', slug: 'publish', description: 'ほしのなか政府の宣伝・Web構成上のテック記事など' }
].freeze

Bureau.all.zip(BUREAUS).each do |bureau, info|
  bureau.update(info)
end

# IDが0の記事を初期値に戻す
article = Article.find_or_create_by(id: 0)
article.update({ title: 'テスト用記事', content: '## この記事はテスト用記事です。' })

# 固定されるseed
Bureau.find_or_create_by({ id: 1, name: '総務局', slug: 'general', description: '生活事項全般の雑多な記事' })
Bureau.find_or_create_by({ id: 2, name: '財務局', slug: 'finance', description: 'ほしのなか政府の財政・お金関係の記事' })
Bureau.find_or_create_by({ id: 3, name: '法務局', slug: 'justice', description: 'ほしのなか政府で策定、議論された規則や条例・その他法律に関する記事' })
Bureau.find_or_create_by({ id: 4, name: '医務局', slug: 'medical', description: '健康・医薬品などの記事' })
Bureau.find_or_create_by({ id: 5, name: '労務局', slug: 'labor', description: '仕事・就職に関する記事' })
Bureau.find_or_create_by({ id: 6, name: '学務局', slug: 'education', description: '教育・資格に関する記事' })
Bureau.find_or_create_by({ id: 7, name: '外交局', slug: 'foreign', description: 'イベント・交流などの記事' })
Bureau.find_or_create_by({ id: 8, name: '娯楽局', slug: 'entertainment', description: 'ゲーム・カラオケなどの趣味、その考え方に関する記事' })
Bureau.find_or_create_by({ id: 9, name: '広報局', slug: 'publish', description: 'ほしのなか政府の宣伝・Web構成上のテック記事など' })
