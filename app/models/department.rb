class Department < ActiveHash::Base
	self.data = [
		{ id: 1, name: '---' },
		{ id: 2, name: '総務部' },
		{ id: 3, name: '人事部' },
		{ id: 4, name: '経理部' },
		{ id: 5, name: '営業部' },
		{ id: 6, name: '開発部' },
		{ id: 7, name: '事業部' },
		{ id: 8, name: '製造部' },
		{ id: 9, name: 'その他' }
	]

	include ActiveHash::Associations
  has_many :faces

end
