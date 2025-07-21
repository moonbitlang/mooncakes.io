/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js,mbt}"],
  theme: {
    fontFamily: {
      title: ['"Poppins"'],
      sans: [
        '-apple-system',
        'BlinkMacSystemFont',
        '"Segoe UI"',
        'Roboto',
        '"Helvetica Neue"',
        'Arial',
        '"Noto Sans"',
        'sans-serif',
        '"Apple Color Emoji"',
        '"Segoe UI Emoji"',
        '"Segoe UI Symbol"',
      ],
      serif: ['Georgia', 'Cambria', '"Times New Roman"', 'Times', 'serif']
    },
    extend: {
      animation: {
        "logo-spin": "spin 10s linear infinite",
      },
      dropShadow: {
        logo: "0 0 5rem #F3AD61",
      },
      fontSize: {
        tiny: "0.7rem",
      },
      spacing: {
        header: "4rem", /* 64px - the navbar height */
      },
      colors: {
        moonbit: "#cf4f89",
        mooncake: "#fbfaf5",
        mooncake2: "#a9803499",
      },
    },
  },
};