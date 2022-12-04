## utils.awk
function sort(ARRAY,    _sortelements, _sorttemp, _sorti, _sortj) {
        _sortelements=length(ARRAY)-1
        for(_sorti=2; _sorti<=_sortelements; ++_sorti) 
                for(_sortj=_sorti; ARRAY[_sortj-1] > ARRAY[_sortj]; --_sortj) {
                        _sorttemp=ARRAY[_sortj]
                        ARRAY[_sortj] = ARRAY[_sortj-1]
                        ARRAY[_sortj-1] = _sorttemp
                }
        return
}
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
function rmdup(_rmdups,		_rmdupi,_rmdupa,_rmduptemp) {
	for(_rmdupi=1;_rmdupi<=length(_rmdups);_rmdupi++) {
		_rmduptemp=(++_rmdupa[substr(_rmdups,_rmdupi,1)]==1? _rmduptemp substr(_rmdups,_rmdupi,1):_rmduptemp)
	}
	return _rmduptemp
}
