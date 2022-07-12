import 'account.dart';
import 'helpers.dart';

class SpecialAccount extends Account {
  final double limit;

  SpecialAccount({
    required int agency,
    required int number,
    required String name,
    required double limitAmmount,
  })  : limit = limitAmmount,
        super.open(
          type: AccountType.special,
          agency: agency,
          number: number,
          name: name,
        );

  @override
  double balance() {
    return super.balance() + limit;
  }

  @override
  void statement() {
    super.statement();

    String date = ''.padLeft(5);
    String desc = stringWidth('LIMITE', 20);
    String value = formatNumber(limit, 10);

    print('$date $desc $value');

    date = dateToDDMM(DateTime.now());
    desc = stringWidth('DISPONÍVEL', 20);
    value = formatNumber(balance(), 10);

    print('$date $desc $value');
  }

  @override
  void close() {}
}
