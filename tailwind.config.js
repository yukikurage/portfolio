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
      gridTemplateColumns: {
        'link': '6.25rem 1fr',
      },
      fontFamily: {
        'montserrat': ['Montserrat', 'sans-serif'],
        'meiryo': ['Meiryo','メイリオ', 'sans-serif'],
        'title': ['"Big Shoulders Display"', 'sans-serif']
      },
      animation: {
        'fade-in-quick': 'fade-in-keyframes 50ms linear 1',
      },
      keyframes: {
        'fade-in-keyframes': {
          '0%': {opacity: '0'},
          '100%': {opacity: '1'},
        },
      },
      backgroundImage: theme => ({
        'title-bg': "url(./images/bg-title-bar.png)",
      })
    },
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      'youtube': {
        DEFAULT: '#FF0000',
      },
      'twitter': {
        DEFAULT: '#1DA1F2'
      },
      'github': {
        DEFAULT: '#333'
      },
      'soundcloud': {
        DEFAULT: '#ff8800'
      },
      'hatena': {
        DEFAULT: '#242527'
      },
      'pixiv': {
        DEFAULT: '#0097FA'
      },
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
