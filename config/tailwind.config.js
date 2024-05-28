const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
		'./app/views/layouts/*.{erb,haml,html,slim}',
		'./app/views/link/*.{erb,haml,html,slim}',
		'./app/views/visitor/*.{erb,haml,html,slim}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ],
	safelist: [
		'rounded-md', 
		'shadow-md',
		'shadow-xl',
		'w-fit',
		'ring-2',
		'ring-slate-600'
	]
}
