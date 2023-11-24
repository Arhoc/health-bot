import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'

const { exec } = require('child_process');

// Ejecutar el comando "ruby main.rb"
exec('ruby main.rb', (error, stdout, stderr) => {
  if (error) {
    console.error(`Error al ejecutar el comando: ${error.message}`);
    return;
  }
  if (stderr) {
    console.error(`Error en la salida estándar: ${stderr}`);
    return;
  }
  console.log(`Salida estándar: ${stdout}`);
});


createApp(App).mount('#app')
