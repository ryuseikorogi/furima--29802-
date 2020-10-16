class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'レディース' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'コスメ/美容' },
    { id: 4, name: 'キッズ/ベビー/マタニティ' },
    { id: 5, name: 'エンタメ/ホビー' },
    { id: 6, name: '楽器' },
    { id: 7, name: 'チケット' },
    { id: 8, name: 'インテリア/住まい/日用品' },
    { id: 9, name: 'ハンドメイド' },
    { id: 10, name: '食品/飲料/酒' },
    { id: 11, name: 'スポーツ/アウトドア' },
    { id: 12, name: '自転車/バイク' },
    { id: 13, name: 'その他' }
  ]
    end
