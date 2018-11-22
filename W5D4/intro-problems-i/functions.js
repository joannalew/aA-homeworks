function madLib(v, a, n) {
  return `We shall ${v.toUpperCase()} the ${a.toUpperCase()} ${n.toUpperCase()}`;
}

function isSubstring(search, sub) {
	let idx = 0;
	for (let i = 0; i < search.length; i++) {
		if (search[i] == sub[idx]) {
			idx += 1;
			if (idx == sub.length)
				return true;
		}
		else{
			idx = 0;
		}
	}
	return false;
}

function fizzbuzz(ary) {
	res = [];
	for (let i = 0; i < ary.length; i++) {
		if ((ary[i] % 3 == 0 || ary[i] % 5 == 0) && ary[i] % 15 != 0)
			res.push(ary[i]);
	}
	return res;
}

function isPrime(n) {
	if (n == 2)
		return true;
	else if (n < 2)
		return false;

	for (let i = 2; i < n; i++){
		if (n % i == 0)
			return false;
	}

	return true;
}

function sumOfNPrimes(n) {
	let sum = 0;
	let count = 0;
	let prime = 2;
	
	while (count < n) {
		if (isPrime(prime)) {
			sum += prime;
			count++;
		}
		prime++;
	}
	return sum;
}