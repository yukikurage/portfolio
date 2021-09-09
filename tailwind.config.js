module.exports = {
  mode: 'jit',
  // These paths are just examples, customize them to match your project structure
  purge: [
    './public/index.html',
    './src/**/*.purs',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      fontFamily: {
        'montserrat': ['Montserrat', 'sans-serif'],
        'meiryo': ['Meiryo','メイリオ', 'sans-serif'],
        'title': ['"Big Shoulders Display"', 'sans-serif']
      },
      animation: {
        'fade-in-quick': 'fade-in-keyframes 0.08s linear 1',
      },
      keyframes: {
        'fade-in-keyframes': {
          '0%': {opacity: '0'},
          '100%': {opacity: '1'},
        },
      },
      backgroundImage: theme => ({
        'title-bg': "url(./images/nou2_nologo.png)",
      })
    },
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      yukiRed: {
        DEFAULT: '#A8233E',
      },
      yukiYellow: {
        DEFAULT: '#F5F1E7',
      },
      yukiBlack: {
        DEFAULT: '#323232',
      }
    }
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
