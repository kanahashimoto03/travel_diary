class Country < ActiveHash::Base
  self.data = [
    {id: 1, name: '--' },
    {id: 2, name: 'アメリカ' },
    {id: 3, name: 'カナダ' }
  ]
end
