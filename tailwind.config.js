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
      // sans: "Poppins",
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
      animation: {
        'shake-horizontal': 'shake 4.5s ease infinite'
      },
      keyframes: {
        shake: {
            '10%': { transform: 'translateX(0)' },
            '12%': { transform: 'translateX(5px)' },
            '14%': { transform: 'translateX(0px)' },
            '16%': { transform: 'translateX(5px)' },
            '18%': { transform: 'translateX(0px)' },
            '20%': { transform: 'translateX(5px)' },
            '22%': { transform: 'translateX(0)' },
            '100%': { transform: 'translateX(0)' },
        }
      }
    },
  },
  plugins: [require("flowbite/plugin"), require("@tailwindcss/forms")],
};
