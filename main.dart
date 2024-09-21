int main(){
    int number = 2;
    numberToWords(number);
}

String numberToWords(int number) {
  if (number == 0) return 'zero';
  
  const ones = [
    '', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine',
    'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen',
    'seventeen', 'eighteen', 'nineteen'
  ];

  const tens = [
    '', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'
  ];

  const thousands = ['', 'thousand', 'million', 'billion'];

  String words = '';
  int i = 0;

  while (number > 0) {
    int chunk = number % 1000;
    if (chunk > 0) {
      String chunkWords = '';

      if (chunk >= 100) {
        chunkWords += ones[chunk ~/ 100] + ' hundred ';
        chunk %= 100;
      }

      if (chunk >= 20) {
        chunkWords += tens[chunk ~/ 10] + ' ';
        chunk %= 10;
      }

      if (chunk > 0) {
        chunkWords += ones[chunk] + ' ';
      }

      words = chunkWords + thousands[i] + ' ' + words;
    }
    number ~/= 1000;
    i++;
  }

  return words.trim();
}
