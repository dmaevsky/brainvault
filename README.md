# BrainVault
Memorize a 128-bit AES key in 5 minutes.

I designed a mnemonic scheme inspired by the [PAO technique](https://en.wikipedia.org/wiki/Mnemonic_peg_system#The_PAO_System) and the [Method of loci](https://en.wikipedia.org/wiki/Method_of_loci) used by memory competition athletes.

128 = 5 × (6 + 5 + 6 + 7) + 8

Thus, each triplet of bytes in the key (24 bits) is encoded as a short phrase designed to imprint a whimsical, memorable image in your brain:
```
[subject][location][action][object]
  6 bits   5 bits   6 bits  7 bits
```
For example:

```
Taylor Swift, aboard a pirate ship in a stormy sea, punching a singing llama
```
Who could forget that? 🙃😜

You need to remember just 5 of these images (use your fingers while memorizing to improve recall), plus a single-byte "magic number."

My experiments so far show that the average person can totally do this within 5 minutes.

128-bit AES encryption is currently considered impossible to brute force and is likely to remain so for the foreseeable future.

## Scripts
- `newkey.sh`: Generate a new 128-bit key and its mnemonic encoding
- `recall.sh`: Extract the key from your memory

## Dependencies
You need [fzf](https://github.com/junegunn/fzf) for the `recall` script to work.

Install it with:
- `brew install fzf` if you're on Mac, or
- [Download from here](https://github.com/junegunn/fzf/releases), or
- Use your favorite package manager.

## Dos and Don'ts
- **Don't** cherry-pick your phrases. Just embrace the randomness and go with the first or second set that `newkey.sh` generates. If you try to be "smart", you'll compromise the entropy, and your key will not be secure.
- **Don't** store the key or generated phrases in a file or take screenshots. The whole point is for your brain to be the only storage facility.
- **Don't** ever run these scripts in public or on an untrusted machine.
- **Do** practice `recall` several times on the first day, then once daily for a week, once weekly for a month, and monthly thereafter.
