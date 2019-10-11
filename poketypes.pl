type(normal).
type(fire).
type(water).
type(electric).
type(grass).
type(ice).
type(fighting).
type(poison).
type(ground).
type(flying).
type(psychic).
type(bug).
type(rock).
type(ghost).
type(dragon).
type(dark).
type(steel).
type(fairy).

immune(ghost, normal).
immune(ground, electric).
immune(ghost, fighting).
immune(steel, poison).
immune(flying, ground).
immune(dark, psychic).
immune(normal, ghost).
immune(fairy, dragon).

weak(normal, rock).
weak(normal, steel).
weak(fire, fire).
weak(fire, water).
weak(fire, rock).
weak(fire, dragon).
weak(water, water).
weak(water, grass).
weak(water, dragon).
weak(electric, electric).
weak(electric, grass).
weak(electric, dragon).
weak(grass, fire).
weak(grass, grass).
weak(grass, poison).
weak(grass, flying).
weak(grass, bug).
weak(grass, dragon).
weak(grass, steel).
weak(ice, fire).
weak(ice, water).
weak(ice, ice).
weak(ice, steel).
weak(fighting, poison).
weak(fighting, flying).
weak(fighting, psychic).
weak(fighting, bug).
weak(fighting, fairy).
weak(poison, poison).
weak(poison, ground).
weak(poison, rock).
weak(poison, ghost).
weak(ground, grass).
weak(ground, bug).
weak(flying, electric).
weak(flying, rock).
weak(flying, steel).
weak(psychic, psychic).
weak(psychic, steel).
weak(bug, fire).
weak(bug, fighting).
weak(bug, poison).
weak(bug, flying).
weak(bug, ghost).
weak(bug, steel).
weak(bug, fairy).
weak(rock, fighting).
weak(rock, ground).
weak(rock, steel).
weak(ghost, dark).
weak(dragon, steel).
weak(dark, fighting).
weak(dark, dark).
weak(dark, fairy).
weak(steel, fire).
weak(steel, water).
weak(steel, electric).
weak(steel, steel).
weak(fairy, fire).
weak(fairy, poison).
weak(fairy, steel).

strong(fire, grass).
strong(fire, ice).
strong(fire, bug).
strong(fire, steel).
strong(water, fire).
strong(water, ground).
strong(water, rock).
strong(electric, water).
strong(electric, flying).
strong(grass, water).
strong(grass, ground).
strong(grass, rock).
strong(ice, grass).
strong(ice, ground).
strong(ice, flying).
strong(ice, dragon).
strong(fighting, normal).
strong(fighting, ice).
strong(fighting, rock).
strong(fighting, dark).
strong(fighting, steel).
strong(poison, grass).
strong(poison, fairy).
strong(ground, fire).
strong(ground, electric).
strong(ground, poison).
strong(ground, rock).
strong(ground, steel).
strong(flying, grass).
strong(flying, fighting).
strong(flying, bug).
strong(psychic, fighting).
strong(psychic, poison).
strong(bug, grass).
strong(bug, psychic).
strong(bug, dark).
strong(rock, fire).
strong(rock, ice).
strong(rock, flying).
strong(rock, bug).
strong(ghost, psychic).
strong(ghost, ghost).
strong(dragon, dragon).
strong(dark, psychic).
strong(dark, ghost).
strong(steel, ice).
strong(steel, rock).
strong(steel, fairy).
strong(fairy, fighting).
strong(fairy, dragon).
strong(fairy, dark).