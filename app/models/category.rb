class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'place to stay(宿泊)' },
    { id: 3, name: 'things to eat(食事)' },
    { id: 4, name: 'things to do(やること)' },
    { id: 5, name: 'things to see(観るもの)' }
  ]
end
