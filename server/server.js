const http = require("http");

const PORT = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
    res.setHeader("Content-Type", "application/json");

    if (req.url === "/") {
        res.writeHead(200);
        res.end(JSON.stringify({
            name: "Vader EA",
            status: "online",
            system: "CRT Trading System"
        }));
        return;
    }

    if (req.url === "/status") {
        res.writeHead(200);
        res.end(JSON.stringify({
            bot: "Vader EA",
            status: "waiting",
            trading: false
        }));
        return;
    }

    res.writeHead(404);
    res.end(JSON.stringify({
        error: "Not found"
    }));
});

server.listen(PORT, () => {
    console.log(`Vader EA server running on port ${PORT}`);
});
