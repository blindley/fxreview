import itertools

def stars_basic(n):
    for numStars in range(1, n):
        for _ in range(numStars):
            print('* ', end='')
        print()
    for numStars in range(n, 0, -1):
        for _ in range(numStars):
            print('* ', end='')
        print()

def stars_fancy(n):
    for numStars in itertools.chain(range(1, n), range(n, 0, -1)):
        print('* ' * numStars)


def up_and_down(start, top, end):
    for i in range(start, top):
        yield i
    for i in range(top, end - 1, -1):
        yield i

def stars_custom(n):
    for numStars in up_and_down(1, n, 1):
        for _ in range(numStars):
            print('* ', end='')
        print()
