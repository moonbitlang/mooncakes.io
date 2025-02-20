/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js,mbt}"],
  theme: {
    container: {
      center: true
    },
    fontFamily: {
      title: ['"Poppins"'],
      sans: ["Fira Sans", "sans-se"],
      roboto: ['"Roboto Mono"'],
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
      colors: {
        moonbit: "#cf4f89",
        mooncake: "#fbfaf5",
        mooncake2: "#a9803499",
      },
    },
  },
  plugins: [require("tailwind-scrollbar")],
};
