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
    fontFamily: {
      // sans: "Roboto",
      title: "Pacifico",
      // title: "Water brush",
    },
    extend: {
      colors: {
        main: {
          50: "#f2fbf8",
          100: "#d3f4ea",
          200: "#a8e7d6",
          300: "#87dac6",
          400: "#47baa1",
          500: "#2e9e89",
          600: "#227f6f",
          700: "#1f665a",
          800: "#1d524b",
          900: "#1c453f",
          950: "#0b2826",
        },
      },
    },
  },
  plugins: [require("flowbite/plugin"), require("@tailwindcss/forms")],
};
