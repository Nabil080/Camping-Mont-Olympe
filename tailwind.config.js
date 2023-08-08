/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./assets/**/*.js",
    "./templates/*.html.twig",
    "./templates/**/*.html.twig",
    "./templates/**/**/*.html.twig",
    "./src/Form/**.php",
    "./node_modules/flowbite/**/*.js", // set up the path to the flowbite package
    "./vendor/symfony/twig-bridge/Resources/views/Form/tailwind_2_layout.html.twig", // tailwind form theme
  ],
  theme: {
    // fontFamily: {
    // sans: 'Roboto',
    // title: 'Montserrat',
    // },
    extend: {
      colors: {
        main: {
          50: "#effefa",
          100: "#c5ffef",
          200: "#91fee2",
          300: "#52f6d2",
          400: "#1fe2be",
          500: "#06c6a5",
          600: "#029f87",
          700: "#067f6d",
          800: "#0a6559",
          900: "#0e534a",
          950: "#00332e",
        },
      },
    },
  },
  plugins: [require("flowbite/plugin"), require("@tailwindcss/forms")],
};
