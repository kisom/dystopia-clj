(ns dystopia.test.hash
  (:use [clojure.test]
        [clojure.string :only [join]]
        [dystopia.hash]))

(def sha256-test-vectors
  #^{:doc "test vectors from the NESSIE project (http://is.gd/jdM99e)"}
  [{ :message ""
    :expected "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"}
   { :message "a"
    :expected "ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb"}
   { :message "abc"
    :expected "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"}
   { :message "message digest"
    :expected "f7846f55cf23e14eebeab5b4e1550cad5b509e3348fbc4efa3a1413d393cb650"}
   { :message "abcdefghijklmnopqrstuvwxyz"
    :expected "71c480df93d6ae2f1efad1447c66c9525e316218cf51fc8d9ed832f2daf18b73"}
   { :message "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
    :expected "248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1"}
   { :message "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    :expected "db4bfcbd4da0cd85a60c3c37d3fbd8805c77f15fc6b1fdfe614ee0a7c8fdb4c0"}])

(def sha256-fail-vectors
  #^{:doc "test vectors that should fail."}
  [{:message "fail1" :expected "not a hash"}
   {:message "FOO"
    :expected "2c26b46b68ffc68ff99b453c1d30413413422d706483bfa0f98a5e886266e7ae"}])

(deftest sha256-test
  "Test the SHA256 implementation against the test vectors."
  (doseq [test-vec sha256-test-vectors]
    (is (compare-sha256 (:message test-vec) (:expected test-vec)))))

(deftest sha2560-fail
  "Ensure SHA256 fails when the hashes don't match."
  (doseq [test-vec sha256-fail-vectors]
    (is (not (compare-sha256 (:message test-vec) {:expected test-vec})))))
