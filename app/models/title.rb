class Title < ActiveHash::Base
  include ActiveHash::Associations
  has_many :posts

  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '下書き' },
    { id: 3, name: '心停止' },
    { id: 4, name: '外傷' },
    { id: 5, name: '意識障害' },
    { id: 6, name: 'その他' }
  ]
end 