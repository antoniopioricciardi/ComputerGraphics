function padded_array = pad(array,padding_to_add)
%PAD Summary of this function goes here
%   padding_to_add (integer): the amount of padding to perform

padded_array = padarray(array, [0, padding_to_add], 'post');
end

