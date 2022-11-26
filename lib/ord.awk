function ordc(_ordi) {
	return sprintf("%c",_ordi+0.0)
}
function ord_init() {
	for(_ordi=32; _ordi<128; _ordi++) {
		_ORD[ordc(_ordi)] = _ordi
	}
}
function ordn(_ordc) {
	return _ORD[_ordc]
}
BEGIN { 
	ord_init() 
}
