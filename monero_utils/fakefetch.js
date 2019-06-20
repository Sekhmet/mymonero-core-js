function fetch(url) {
	const decodePromise = new Promise((resolve, reject) => {
		resolve(Uint8Array.from(atob(WASM), c => c.charCodeAt(0)));
	});

	return new Promise((resolve, reject) => {
		resolve({
			ok: true,
			arrayBuffer: () => decodePromise,
		});
	});
}
