
function getBlinked(aSec) {
    if (currentSec === aSec) {
        return false;
    } else {
        currentSec = aSec;
        return true;
    }
}

function setBlinked(aSwap) {
    if (aSwap) {
        setup.blink = !setup.blink;
    }
}

function fillCanvasByColor(context, color) {
    context.fillStyle = color;
    context.fillRect(0, 0, canvas.width, canvas.height);
}

function translateContex(context) {
    context.translate(canvas.width / 2 - setup.digitRelAllWidth / 2 - setup.digitSize / 2,
                      canvas.height / 2 - setup.digitSize / 2);
}

function determineDigit(digit) {
    switch (digit) {
    default:
    case 0:
        return setup.init.digits.digit_0;
    case 1:
        return setup.init.digits.digit_1;
    case 2:
        return setup.init.digits.digit_2;
    case 3:
        return setup.init.digits.digit_3;
    case 4:
        return setup.init.digits.digit_4;
    case 5:
        return setup.init.digits.digit_5;
    case 6:
        return setup.init.digits.digit_6;
    case 7:
        return setup.init.digits.digit_7;
    case 8:
        return setup.init.digits.digit_8;
    case 9:
        return setup.init.digits.digit_9;
    }
}
