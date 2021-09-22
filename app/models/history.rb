class History < ActiveHash::Base
	self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '１〜５年' },
    { id: 3, name: '６〜10年' },
    { id: 4, name: '11〜15年' },
    { id: 5, name: '16〜20年' },
		{ id: 6, name: '21〜25年' },
		{ id: 7, name: '26〜30年' },
		{ id: 8, name: '31年〜' }
  ]

	include ActiveHash::Associations
  has_many :faces
	
end
