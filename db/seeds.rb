# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brands = Brand.create(
  [
    {
      name: 'shoyeido',
      country: 'Japan',
      approved: true,
      description: 'A very famous Japanese incense brand.'
    },
    {
      name: 'baieido',
      country: 'Japan',
      approved: false,
      description: 'A very old Japanese incense brand.'
    }
  ]
)

lines = Line.create(
  [
    {
      name: 'daily',
      brand_id: brands.first,
      approved: true,
      description: 'Good for day to day use'
    },
    {
      name: 'premium',
      brand_id: brands.first,
      approved: false,
      description: 'Shoyeidos high end incense line'
    }
  ]
)

incenses = Incense.create(
  [
    {
      name: 'golden pavilion',
      line_id: lines.first,
      description: 'A spicy, earthy daily incense'
    },
    {
      name: 'white cloud',
      line_id: lines.first,
      description: 'A great, aloeswood based daily incense'
    }
  ]
)
