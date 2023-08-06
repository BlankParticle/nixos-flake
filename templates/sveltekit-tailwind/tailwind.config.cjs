/* eslint-disable @typescript-eslint/no-var-requires */
/** @type {import("tailwindcss").Config}*/
const config = {
  content: ["./src/**/*.{html,js,svelte,ts}"],
  theme: {
    extend: {},
  },
  experimental: {
    optimizeUniversalDefaults: true,
  },
};

module.exports = config;
