struct Option {
    is_some: usize,
    value: usize,
}

impl Option {
    fn some(value: usize) -> Self {
        Option { is_some: 1, value }
    }

    fn none() -> Self {
        Option { is_some: 0, value: 0 }
    }

    fn is_some(&self) -> bool {
        self.is_some == 1
    }

    fn value(&self) -> usize {
        self.value
    }
}

fn maybe_icecream(time_of_day: usize) -> Option {
    if time_of_day < 22 {
        Option::some(5)
    } else if time_of_day < 24 {
        Option::some(0)
    } else {
        Option::none()
    }
}

#[test]
fn check_icecream() {
    assert!(maybe_icecream(9).is_some() && maybe_icecream(9).value() == 5, "err_1");
    assert!(maybe_icecream(10).is_some() && maybe_icecream(10).value() == 5, "err_2");
    assert!(maybe_icecream(23).is_some() && maybe_icecream(23).value() == 0, "err_3");
    assert!(maybe_icecream(22).is_some() && maybe_icecream(22).value() == 0, "err_4");
    assert!(!maybe_icecream(25).is_some(), "err_5");
}

#[test]
fn raw_value() {
    let icecreams = maybe_icecream(12);
    assert!(icecreams.is_some() && icecreams.value() == 5, "err_6");
}

