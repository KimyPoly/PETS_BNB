import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pet-map"
export default class extends Controller {
  connect() {
    this.animal = this.createAnimal();
    this.moveInterval = setInterval(this.autoMove.bind(this), 2000);
  }

  createAnimal() {
    const mapContainer = this.element.querySelector('.map-container');
    const animal = document.createElement('div');
    animal.className = 'animal';
    animal.style.width = '50px';
    animal.style.height = '50px';
    animal.style.backgroundColor = 'red';
    animal.style.position = 'absolute';
    animal.style.top = '50px'; // Position initiale de l'animal
    animal.style.left = '50px'; // Position initiale de l'animal
    mapContainer.appendChild(animal);
    return animal;
  }

  autoMove() {
    const step = 10;
    const randomDirection = ['ArrowUp', 'ArrowDown', 'ArrowLeft', 'ArrowRight'][Math.floor(Math.random() * 4)];
    this.moveAnimal(randomDirection);
  }

  moveAnimal(direction) {
    const step = 10;
    const mapContainer = this.element.querySelector('.map-container');
    const mapWidth = mapContainer.clientWidth - 50; // Limite horizontale de la carte
    const mapHeight = mapContainer.clientHeight - 50; // Limite verticale de la carte

    const newPosition = (current, limit, move) => {
      const position = parseInt(current || '0');
      const newPosition = position + move;
      return newPosition >= 0 && newPosition <= limit ? newPosition : position;
    };

    switch (direction) {
      case 'ArrowUp':
        this.animal.style.top = `${newPosition(this.animal.style.top, mapHeight, -step)}px`;
        break;
      case 'ArrowDown':
        this.animal.style.top = `${newPosition(this.animal.style.top, mapHeight, step)}px`;
        break;
      case 'ArrowLeft':
        this.animal.style.left = `${newPosition(this.animal.style.left, mapWidth, -step)}px`;
        break;
      case 'ArrowRight':
        this.animal.style.left = `${newPosition(this.animal.style.left, mapWidth, step)}px`;
        break;
    }
  }
}
