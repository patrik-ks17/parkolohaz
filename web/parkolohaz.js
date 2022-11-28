const form = document.querySelector('#contactForm');

function velemenyKuldes() {
	let nev = form.elements.name.value;
	let email = form.elements.email.value;
	let telefon = form.elements.phone.value;
	let uzenet = form.elements.message.value;

	const body = {
		name: nev,
		email: email,
		phone: telefon,
		message: uzenet
	}

	if (!nev || !email || !telefon || !uzenet) { 
		alert('Kérjük minden mezőt töltsön ki az űrlapon!');
		return;
	}

	fetch('/api/kapcsolat', {
		method: 'POST',
		body: JSON.stringify(body),
		headers: {
			'content-type': 'application/json'
		}
	})
	.then(res => {
		if(res.ok) {
			form.elements.name.value = '';
			form.elements.email.value = '';
			form.elements.phone.value = '';
			form.elements.message.value = '';
			alert('Munkatársunk hamarosan keresni fogja önt!');
		}
	}
	)
}


const szamlalo = document.querySelector('#szamlalo')

window.onload = () => {
	setInterval(() => {
		let szamlal = Number(szamlalo.innerHTML);
		szamlalo.innerHTML = szamlal + 1;
	}, 500)
}
