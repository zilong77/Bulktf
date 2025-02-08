require("dotenv").config();
const { ethers } = require("ethers");
const readline = require("readline");

// Fungsi untuk membaca input dari terminal
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

async function askQuestion(query) {
  return new Promise((resolve) => rl.question(query, resolve));
}

async function getAddresses() {
  const input = await askQuestion("Masukkan alamat penerima (dipisahkan dengan spasi): ");
  
  // Pisahkan berdasarkan spasi dan validasi alamat
  const addresses = input.trim().split(/\s+/).filter(addr => ethers.isAddress(addr));

  if (addresses.length === 0) {
    console.log("❌ Tidak ada alamat yang valid. Program dihentikan.");
  }

  return addresses;
}

async function sendBulkTransfer() {
  try {
    const rpcUrl = await askQuestion("Masukkan RPC URL: ");
    const privateKey = await askQuestion("Masukkan Private Key: ");
    const amount = await askQuestion("Masukkan jumlah (ETH/MATIC): ");
    
    const addresses = await getAddresses();
    if (addresses.length === 0) {
      rl.close();
      return;
    }

    const provider = new ethers.JsonRpcProvider(rpcUrl);
    const wallet = new ethers.Wallet(privateKey, provider);
    const amountInWei = ethers.parseEther(amount);

    console.log(`🔹 Mengirim ${amount} ETH/MATIC ke ${addresses.length} alamat...`);

    for (const address of addresses) {
      try {
        const tx = await wallet.sendTransaction({ to: address, value: amountInWei });
        console.log(`✅ Berhasil: ${address} | Tx Hash: ${tx.hash}`);
        await tx.wait();
      } catch (error) {
        console.error(`❌ Gagal: ${address}`, error);
      }
    }
  } catch (error) {
    console.error("Terjadi kesalahan:", error);
  } finally {
    rl.close();
  }
}

sendBulkTransfer();
