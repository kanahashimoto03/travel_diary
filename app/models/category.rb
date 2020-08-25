class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'place to stay' },
    { id: 3, name: 'things to eat' },
    { id: 4, name: 'things to do' },
    { id: 5, name: 'things to see' }
  ]
end
