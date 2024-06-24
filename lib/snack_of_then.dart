import 'dart:async';

/**
 * Usage: Put async code block between `await lock()` and `unlock()` methods
 */

/// Original

class Lock {
  Completer? _completer;

  Future<void> lock() async {
    while (_completer != null) {
      await _completer!.future;
    }
    _completer = Completer();
  }

  void unlock() {
    if (_completer != null && !_completer!.isCompleted) {
      _completer!.complete();
      _completer = null;
    }
  }
}

/// Fusion

class LockFusion {
  final List<Completer> completerQueue = [];

  Future<void> lock() async {
    Completer? previous = completerQueue.isNotEmpty ? completerQueue.last : null;
    completerQueue.add(Completer());
    if (previous != null) {
      await previous.future;
    }
  }

  void unlock() {
    if (completerQueue.isNotEmpty) {
      Completer completer = completerQueue.removeAt(0);
      if (!completer.isCompleted) {
        completer.complete();
      }
    }
  }
}

/**
 * Usage: Pass the async function as parameter to `lock(function)` method
 */

/// Advanced

class LockSuperior {
  Completer? _completer;

  Future lock(Future Function() fn) async {
    Completer? previous = _completer;
    Completer completer = Completer();
    _completer = completer;

    if (previous != null) {
      await previous.future;
    }
    try {
      await fn();
    } finally {
      completer.complete();

      /// clear
      if (identical(_completer, completer)) {
        _completer = null;
      }
    }
  }
}

/// Summit

class LockSummit {
  Future? _future;

  Future lock(Future Function() fn) async {
    Future? previous = _future;

    if (previous != null) {
      _future = previous.then((v) async {
        await fn();
      });
    } else {
      _future = fn();
    }
  }
}

Future<void> longTask(int i) async {
  print('long task start: $i');
  await Future.delayed(Duration(seconds: 1));
  print('long task done: $i');
}

Lock lock = Lock();
LockFusion lockFusion = LockFusion();
LockSuperior lockSuperior = LockSuperior();
LockSummit lockSummit = LockSummit();

void main(List<String> arguments) async {
  for (int i = 0; i < 5; i++) {
    startWithLock(i, true);
  }

  for (int i = 0; i < 5; i++) {
    startWithLockFusion(i, true);
  }

  for (int i = 0; i < 5; i++) {
    lockSuperior.lock(() => longTask(i));
  }

  for (int i = 0; i < 5; i++) {
    lockSummit.lock(() => longTask(i));
  }
}

void startWithLock(int i, bool enable) async {
  if (enable) await lock.lock();
  await longTask(i);
  if (enable) lock.unlock();
}

void startWithLockFusion(int i, bool enable) async {
  if (enable) await lockFusion.lock();
  await longTask(i);
  if (enable) lockFusion.unlock();
}
