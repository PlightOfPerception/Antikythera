TARGETS=AntiKythera Test WheelData

AntiKythera: AntiKythera.hs
	ghc -main-is AntiKythera -dynamic AntiKythera.hs

Test: Test.hs AntiKythera.hs
	ghc -dynamic Test.hs

clean:
	rm -f $(TARGETS) *.hi *.o
