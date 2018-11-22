Array.prototype.uniq = function() {
	let ary = [];

	for (let i = 0; i < this.length; i++){
		if (ary.indexOf(this[i]) === -1){
			ary.push(this[i]);
		}
	}

	return ary;
};

Array.prototype.twoSum = function() {

	for (let i = 0; i < this.length - 1; i++){
		for (let j = i + 1; j < this.length; j++){
			if (this[i] + this[j] == 0) {
				return [i, j];
			}
		}
	}

	return [];
};

Array.prototype.transpose = function() {
	let rows = this.length;
	let cols = this[0].length;
	let mat = Array.from(Array(rows), () => new Array(cols))

	for (let i = 0; i < rows; i++){
		for (let j = 0; j < cols; j++){
			mat[j][i] = this[i][j];
		}
	}

	return mat;
}