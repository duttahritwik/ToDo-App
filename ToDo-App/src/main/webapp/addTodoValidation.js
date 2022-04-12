const personName = document.getElementById("personName");
const todoName = document.getElementById("todoName");
const inputState = document.getElementById("inputState");
const addTodoForm = document.getElementById('addTodoForm');
const errorMessage = document.getElementById('error-message');

addTodoForm.addEventListener('submit', (e) => {
	
	const dataSubmitted = [
	  { text: personName.value, type: 'Person Name' },
	  { text: todoName.value, type: 'Todo Name' },
	  { text: inputState.value === '--Select--' ? '' : inputState.value, type: 'Todo Status' }
	]
	
  for (let dataField of dataSubmitted) {
	
    if (dataField.text.length === 0) {
      e.preventDefault()
      errorMessage.innerHTML = `${dataField.type} cannot be empty`
      errorMessage.style.display = 'block'
      errorMessage.style.color = 'red'
      break
    } else {
      errorMessage.style.display = 'none'
    }
  }
})
