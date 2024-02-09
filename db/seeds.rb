# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 変動するseed
Article.create({ id: 0, title: 'テスト用記事', content: '## この記事はテスト用記事です。' }) unless Article.find_by(id: 0)

Admins::Announcement.create({ id: 0, content: nil }) unless Admins::Announcement.find_by(id: 0)

# 固定されるseed
Bureau.find_or_create_by({ id: 1, name: '総務局', slug: 'general' })
Bureau.find_or_create_by({ id: 2, name: '財務局', slug: 'finance' })
Bureau.find_or_create_by({ id: 3, name: '法務局', slug: 'justice' })
Bureau.find_or_create_by({ id: 4, name: '医務局', slug: 'medical' })
Bureau.find_or_create_by({ id: 5, name: '労務局', slug: 'labor' })
Bureau.find_or_create_by({ id: 6, name: '学務局', slug: 'education' })
Bureau.find_or_create_by({ id: 7, name: '外交局', slug: 'foreign' })
Bureau.find_or_create_by({ id: 8, name: '娯楽局', slug: 'entertainment' })
Bureau.find_or_create_by({ id: 9, name: '広報局', slug: 'publish' })
