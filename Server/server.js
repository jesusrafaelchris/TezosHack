const express = require('express');
const app = express();
app.use(express.json());
const port = 3000;

//List of NFTs
const nfts = [ 
	{id: 1, name: "John's NFT", hash: 'QmRsdpc6QjqV9gCM3uAxQEqAVRZH3V2Z2svudXuEf6wm8S'},
	{id: 2, name: "Kitti's NFT", hash: 'S8mw6fEuXduvs2Z2V3HZRVAqEQxAu3MCg9VqjQ6cpdsRmQ'},
	{id: 3, name: "Suzanne's NFT", hash: '7xmNfrWFyaNpqXEliHdmJatPW5IS3QRhSXaTFokDf48a'},
];

//Stores Wallet ID
app.get("/wallet/:id", (req, res, next) => {
	const wallet = req.params.id;
	res.send(wallet);
});

//Lists NFT's
app.get("/nft/list", (req, res, next) => {
	res.json(nfts)
});

//Buys NFT's
app.get("/nft/buy/:id", (req, res, next) => {
	const nft = nfts.find(c => c.id === parseInt(req.params.id));
	if (!nft) res.status(404).send('There is no NFT with this ID minted')
	res.send("Sending NFT to your wallet")
	res.send(nft);
});

//Adds new NFT's
app.post('/nft/buy', (req, res, next) => {
	const nft = {
		id: nfts.length + 1,
		name: req.body.name
	};
	nfts.push(nft);
	res.send(nft);
});

app.listen(port, () => console.log(`Server listening on ${port}!`))




