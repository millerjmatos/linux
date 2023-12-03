Gerando o hash de um arquivo:

	sha256sum linux.iso

	sha512sum linux.iso

	md5sum linux.iso

O código gerado é único, e garante que aquele arquivo é idêntico ao original.

Para testar se o download de uma .iso não foi corrompido:

	sha256sum -c SHA256SUM

Na prática, a criação e teste ficam assim:

	sha256sum centos.iso > sha256.txt ; cat sha256.txt ; sha256sum -c sha256.txt