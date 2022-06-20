enum combatPhases {
	
}

global.unitarr = [];

// sort used for ordering 
function sort(arr, first, last){
	if(last<first){
		var pIndex = part(arr, first, last); //partition index
	
		sort(arr, first, pIndex-1);
		sort(arr, pIndex+1, last);
	}
}

function part(arr, first, last){
	var piv = arr[| last];
	var index = first-1;
	
	for(var v=0; v<last; v++){
		if(arr[| v]<piv){
			index++;
			
			//swap array[index] and array[v] if array[v] is smaller than pivot
			var tempI = arr[| index];
			var tempV = arr[| v];
			
			ds_list_set(arr, index, tempV);
			ds_list_set(arr, v, tempI);
			
		}
	}
	var tempI = arr[index+1];
	var tempLast = arr[last];
	
	ds_list_set(arr, index+1, tempLast);
	ds_list_set(arr, last, tempI);
	
	return index+1;
}